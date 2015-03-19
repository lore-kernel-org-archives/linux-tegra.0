From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 2/8] tegrarcm: Add support for loading cpu
 ucode
Date: Thu, 19 Mar 2015 13:42:45 -0600
Message-ID: <550B26B5.8030903@wwwdotorg.org>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com> <1426639141-12060-3-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426639141-12060-3-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/17/2015 06:38 PM, Jimmy Zhang wrote:
> From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The Denver CPU in Tegra132 requires microcode to be loaded before CPU
> initialization. There are two microcode files required, preboot ucode
> "preboot_cr.bin" and cpu ucode "mts_cr.bin".  Add support for loading
> ucode either by the filenames or by directory name from the command line.
> Use default directory "/lib/firmware/nvidia/tegra132/denver-ucode" when
> neither filename nor directory name is given in command line.

I get conflicts when applying this patch. Is it based on the latest 
github code?

(I validated this was nothing to do with my having applied patch 5 already)
