From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 4/5] Add new configuration keyword
 "RehashBl"
Date: Thu, 8 Oct 2015 14:45:08 -0600
Message-ID: <5616D5D4.6050901@wwwdotorg.org>
References: <1444333109-3671-1-git-send-email-jimmzhang@nvidia.com>
 <1444333109-3671-5-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444333109-3671-5-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2015 01:38 PM, Jimmy Zhang wrote:
> This feature is needed in case an image is updated at later stage
> after boo

timage has been created.
>
> How to use:
>    Add keyword "RehashBl" to configuration file, for example, update.cfg:
>      RehashBl;
>
>    Invoke cbootimage to re-calculate bootloader aes hash, for example, for
>    bootimage bootloader.bin:
>      $ cbootimage -s tegra210 --update update.cfg bootloader.bin bootloader.bin-resigned
>
>    Where bootloader.bin-resigned is the resigned bootimage bootloader.bin

> diff --git a/src/data_layout.c b/src/data_layout.c

> +}
> +
> diff --git a/src/data_layout.h b/src/data_layout.h

Now there's an empty line (two \ns) at the end of the file.
