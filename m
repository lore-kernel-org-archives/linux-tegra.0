From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: convert device tree files to use key defines
Date: Thu, 12 Dec 2013 13:08:35 -0700
Message-ID: <52AA17C3.5050700@wwwdotorg.org>
References: <1385989797-10879-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385989797-10879-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/02/2013 06:09 AM, Laxman Dewangan wrote:
> Use key code macros for all key code refernced for keys.
> 
> For tegra20-seaboard.dts and tegra20-harmony.dts:
>   The key comment for key (16th row and 1st column) is KEY_KPSLASH but
>   code is 0x004e which is the key code for KEY_KPPLUS. As there other
>   key exist with KY_KPPLUS, I am assuming key code is wrong and comment
>   is fine. With this assumption, I am keeping the key code as KEY_KPSLASH.

I've applied this to Tegra's for-3.14/dt branch.
