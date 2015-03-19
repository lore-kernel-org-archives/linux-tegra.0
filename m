From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 0/8] Add T132 support
Date: Thu, 19 Mar 2015 13:46:58 -0600
Message-ID: <550B27B2.5000908@wwwdotorg.org>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426639141-12060-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/17/2015 06:38 PM, Jimmy Zhang wrote:
> T132 supporting patches were originally started under branch
> dev/amartin/t132-dev. After further tuning Allen's patches and adding
> additional changes, t132 supporting tegrarcm is now fully working.
>
> Allen Martin (6):
>    tegrarcm: Add Tegra132 support
>    tegrarcm: Add support for loading cpu ucode
>    tegrarcm: Get platform info
>    tegrarcm: add support for odmdata command
>    tegrarcm: Better usb debug messages
>    tegrarcm: increase USB timeout
>
> Jimmy Zhang (2):
>    Tegra132: Fix miniloader issues when downloading u-boot as flasher
>    Tegra132: Fix issue that cpu sometime can't start when downloading
>      u-boot as flasher

I can't see either of those two patches in my email nor the linux-tegra 
mailing list archives. I also see an extra patch posted that's not in 
this list:

[tegrarcm PATCH v1 2/8] tegrarcm: Add support for loading MTS
