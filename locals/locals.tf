
locals{
    final-name="${var.project}-${var.environment}-${var.component}"
    ec2_tags=merge(
        var.common_tags,
        {
            Environment = "dev",
            Version = 1.1

        }
    )
}