From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH V2 3/5] Add token_supported function
Date: Tue, 08 Apr 2014 13:55:16 -0600
Message-ID: <53445424.5090103@wwwdotorg.org>
References: <1396967422-6018-1-git-send-email-pchiu@nvidia.com> <1396967422-6018-4-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396967422-6018-4-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/08/2014 08:30 AM, Penny Chiu wrote:
> Add a function called token_supported in cbootimage_soc_config.
> It is used to check if the input token is supported in specific
> tegra soc.

> diff --git a/src/t114/nvbctlib_t114.c b/src/t114/nvbctlib_t114.c

> +int t114_bct_token_supported(parse_token token)
> +{
> +	int index;
> +
> +	for (index = 0; index < sizeof(t114_root_token_list)/sizeof(t114_root_token_list[0]); index++)

It'd be nice if we had an ARRAY_SIZE() macro we could use here...

That would also make the line-length a bit more typical.
