From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] [ARM][TEGRA] Fix AHB base address on tegra20, tegra30
 and tegra114
Date: Wed, 12 Aug 2015 15:01:21 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1508121500300.7154@utopia.booyaka.com>
References: <1439042292-19912-1-git-send-email-kwizart@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439042292-19912-1-git-send-email-kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, 8 Aug 2015, Nicolas Chauvet wrote:

> Current base address is wrong by 0x04 bytes for AHB bus device as shown in dmesg:
>  tegra-ahb 6000c004.ahb: incorrect AHB base address in DT data - enabling workaround
> 
> To correct old dtbs,  the commit ce7a10b0ff3db63 checks for the low bit
> of the base address and removes theses 0x04 bytes at runtime.
> 
> This patch fix the original dts, so upstream version doesn't need
> the workaround of the base address.
> 
> As both addresses are valid, this patch doesn't break compatibility
> 
> Tested on tegra20-paz00 (aka ac100)
> 
> Signed-off-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Reviewed-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>


- Paul
