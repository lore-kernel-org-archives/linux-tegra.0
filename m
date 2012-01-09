From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Tegra30 clockframework
Date: Mon, 9 Jan 2012 17:26:03 +0200
Message-ID: <20120109152603.GV32619@tbergstrom-lnx.Nvidia.com>
References: <1326121937-32054-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1326121937-32054-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "open list:TEGRA SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 09, 2012 at 04:12:10PM +0100, Peter De Schrijver wrote:
> This patchset introduces the tegra30 clockframework. Clocks which require
> voltage scaling are not included in this version. The implementation doesn't
> use the generic clock code yet. It's the intention to move to it, once the
> semantics are fully clarified.
> 
> ---
> 
> Changes in v2:
>  * Fix parent clocks for TWD. This makes the SMP configuration booting again.
> 
> Peter De Schrijver (3):
>   ARM: tegra: add support for new clock framework features
>   ARM: tegra: implement basic tegra30 clock framework
>   ARM: tegra: enable tegra30 clock framework

Oops. Now I sent everything twice... Will send it again with the correct
topic etc.

Cheers,

Peter.
