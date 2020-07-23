From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/7] i2c: tegra: DMA support for t186 and t194
Date: Thu, 23 Jul 2020 16:16:52 +0300
Message-ID: <b71ae942-6d9e-f609-f4f6-87d0ce117175@gmail.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
 <1595506733-10307-6-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595506733-10307-6-git-send-email-kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Krishna,

23.07.2020 15:18, Krishna Yarlagadda пишет:
...
>  static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
> @@ -1606,6 +1618,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
>  	.setup_hold_time_fast_fast_plus_mode = 0,
>  	.setup_hold_time_hs_mode = 0,
>  	.has_interface_timing_reg = true,
> +	.has_gpc_dma = true,

false

>  };
