resource "aws_alb" "demo2-ecs-load-balancer" {
  name = "demo2-ecs-load-balancer"
  subnets = [aws_subnet.demo2-PubSN-1.id]
  security_groups = [aws_security_group.demo2-public-security-group.id]
  tags = {
    Name = "Demo2 ecs load balancer"
  }
}

resource "aws_alb_target_group" "demo2-ecs-alb-target-grp" {
  name = "demo2-ecs-alb-target-grp"
  port = 8080
  protocol = "http"
  vpc_id = aws_vpc.demo2-vpc.id
//  health_check {
  //    healthy_threshold   = "5"
  //    unhealthy_threshold = "2"
  //    interval            = "30"
  //    matcher             = "200"
  //    path                = "/"
  //    port                = "traffic-port"
  //    protocol            = "HTTP"
  //    timeout             = "5"
  //  }
  tags = {
    Name = "demo2 ecs alb target group"
  }

}

resource "aws_alb_listener" "demo2-ecs-alb-listener" {
  load_balancer_arn = aws_alb.demo2-ecs-load-balancer.arn
  port = 8080
  protocol = "http"
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.demo2-ecs-alb-target-grp.arn
  }
}