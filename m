From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: fix return value check in tegra_clk_register_pllc()
Date: Tue, 29 Oct 2013 13:40:26 -0600
Message-ID: <52700F2A.1080004@wwwdotorg.org>
References: <CAPgLHd-wYa3Z7J93LmC0rvRPKsrjK+8DEZR+2f+e14RN+p_fPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPgLHd-wYa3Z7J93LmC0rvRPKsrjK+8DEZR+2f+e14RN+p_fPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/28/2013 08:07 PM, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> 
> In case of error, the function __clk_lookup() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should
> be replaced with NULL test.

>  	parent = __clk_lookup(parent_name);
> -	if (IS_ERR(parent)) {
> +	if (!parent) {

clk_get() returns an error-value. It'd be nice if the internal clk APIs
all did the same for consistency... Otherwise, the clock subsystem is
essentially using both NULL and error-values as errors, which is rather
frowned upon.
