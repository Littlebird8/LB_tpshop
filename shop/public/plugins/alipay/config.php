<?php
$config = array (	
		//应用ID,您的APPID。
		'app_id' => "2016091900550315",

		//商户私钥
		'merchant_private_key' => "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCqEh7G+d54vuCr2Csp/uXjjGKEDKKACm8mkZRcCK7e7gJhVmiHsXM/k6JKHQSdpx9X7vCyW/Q/X7HRq2HabgYjp/zKlv93BiOGWJuAZ+J1ZN+jkdZNDeyLO/BNFfPEBu5FWNo4pv4b0jOMDwJVBdmYy7cbV8o7SYuJE3dzqghIcdPkNtdUTHoKXi7oHT0RT5tTnGhF5svEkytb0oe5VnyvjjA28VFrr+75SvUg9f3187n+1REJHQSLB6tn6vHYE2PLbfsKmxIkv+Lmg+kogV+jWAQGiBxuTXY5qzV5kHp+fbVXavSGyZX2hLxe84ryF3FrAvJvt4QlB6jWugnwjKtHAgMBAAECggEATaIP4oxU/ZFERa1bpsPwdLq0jcqmswQQUO7LZmegS6sh8wTamnZqQW9G+cXdQYn0SNONlB1dlUA9j5RICsmGi+g3ANOEsfRfawgvk6HYQfZWD/iWdn4QqE4oF0gaCjWPtqAknQ+9lz2QwjJnwh/1gEYdw6GDcyTTSTNVp7rKJSbyEjfnhR504b+vd42itjsQjRr1b1Vr0Oq4XaQDkX8cKid3hg2AiP1971TFwWFJ71h8EPERLyQ2Ok/UJndIlZ3OG9ma80W3tSA7xnDV2J1rBhFJZJRuXJoTbJkqnEO3PdV9mR0Oh5Gm2Va4/EQorVWn0zzz2hJscSCnkb2Beo9CIQKBgQDX/RjL7brkhM+GSp3SZJ3noeuBOKzQmrq3c+NSmAqYRfoPUdYzXloy37H0hRM4Q7j9uY4AtNY9ntacjcarU4RPg+Scr9jlifrPujk4aLlHaXX+6H7olBQSptyYR+dCJmYpeyM8vpVD9p6Uoe2+LNFXesuuAkcVmiRltBTNlgRI/QKBgQDJk3HBFJKpi0TIHNIhFT/DcCV3IwpOoN91cXbHaaJOgxUft9ifR7ZoO0GJnCI0bBK5/9EgRzkkYYL7SaGHNAgMJyiCoUPPEO3v01vwgXTi+EwRDB5UvOLSuhjdJ/RJ9XixjwlSN/7MpsC5DMRPt/kTZJajN2f0qAHkMoTCSrZqkwKBgQDAbzlmh9pZu5KB3X0bdJXTSEphCTO/b/wnctL4RYo6/S279HfZsJjAdtlAOEhVetEZDfdc3cF7iUdAmHiHMJPTnHlUuL+QUwzpgst0XKmm3GlKwa5AXZ48t/oWmwmJwFiJYLKWbl7i/JlxZ4xAQgIJ5NgPouvebUU8b+OQ/7W1qQKBgQDAl3dgGt/lzYJyD9dUdJDvkf65zWjTpzDZbQcnj+3bRbKxE16NEF9fRv5fFCY6H+fkfl64kFQwRlp27Oq/2x61PdSeuqWm+W3cbfyx1X5wPPuwbfusyquM2vFWnA3ze+1M+HTXcVio/8mzBFesMwJvXPPwDcftIXhtJzdgyzFusQKBgQChZ1fudPFj63yO0+4aCmYvDQ7MvkThXQBEGEAF3sxwuOUQpJoaA8As6ElCtib0hrwWlY2jtAu7itK1Q5KT4lc7nqSKmqCommZRzY+M+cCqg+c5c8MmhRdbH/w6HK7pa1EgICZR8TEK33rVn+ehyUVYF2Xa4+nHl4UbKpESmOyeCA==",
		
		//异步通知地址
		'notify_url' => "http://www.tpshop.com/home/order/backnotify.html",
		
		//同步跳转
		'return_url' => "http://www.tpshop.com/home/order/backreturn.html",

		//编码格式
		'charset' => "UTF-8",

		//签名方式
		'sign_type'=>"RSA2",

		//支付宝网关
		'gatewayUrl' => "https://openapi.alipaydev.com/gateway.do",

		//支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
		'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4pbZ4mpZhB66EabhUxVJeXxPrFVOwqCp73jAN2x4cXwfowcXHLx8rDK68D/xyJ9A+9MWYDPNDvU2ZHjHueY5nT1zRqaN4TDTiyyWKErD4Tewik/cGfByRKs1yBlrQB4rVL4bCAo6WDdDDV0d+oDOH9Y4EuclVPDvR5fyVCj2D4aDU2ij9h6IYHLvjz5onmHjyWD0UeugenVQa7DqtUEWxRDDc6EJpl3jr/9/bxXz6hIuuDJRlkvRbcuKvZanT3TNJOg+EGcvDNlDuM09U3P/ar0op741e3iAiS79pzvSxeKDeJ1DxxeZ7E1Z3yUsKVjzIMgudus+VEFdkVxrbuaNEwIDAQAB",
);