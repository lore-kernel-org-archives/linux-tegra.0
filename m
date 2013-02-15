From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 09/10] clk: tegra: Implement clocks for Tegra114
Date: Fri, 15 Feb 2013 07:18:05 +0100
Message-ID: <20130215.081805.2193798170330624846.hdoyu@nvidia.com>
References: <1360580700-10245-1-git-send-email-pdeschrijver@nvidia.com><1360580700-10245-10-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360580700-10245-10-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Mon, 11 Feb 2013 12:04:59 +0100:

> +enum tegra114_clk {
> +       rtc = 4, timer = 5, uarta = 6, sdmmc2 = 9, i2s1 = 11, i2c1 = 12,

Why no 'cpu = 0' here?
