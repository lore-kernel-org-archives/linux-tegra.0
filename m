From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v1 6/8] Add new configuration keyword
 "ReSignBl"
Date: Mon, 21 Sep 2015 16:10:23 -0600
Message-ID: <5600804F.402@wwwdotorg.org>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
 <1441228760-26042-7-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-7-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/02/2015 03:19 PM, Jimmy Zhang wrote:
> In case an image is updated after initial signing, use "ReSignBl"
> to re-generate aes hash and pkc pss signatures if PkcKey is present.
>
> For example:
>
> Define re-sign.cfg as below:
>     PkcKey = rsa_priv.pem, --save;
>     ReSignBl;
>
> Run command below to re-sign image:
>     $ cbootimage -s tegra210 --update re-sign.cfg image image-re-signed

Is this to support the case where someone just dd's a new bootloader 
into an existing flash image? Why not just rebuild the flash image from 
scratch using existing features?
