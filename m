From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher scripts PATCH] Fix flash --flash-image option
Date: Fri, 17 Jun 2016 10:04:54 -0600
Message-ID: <57641FA6.50706@wwwdotorg.org>
References: <20160617023435.GA22135@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160617023435.GA22135-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/16/2016 08:34 PM, Martin Michlmayr wrote:
> Pass correct variable to avoid the following error:
>
>    File "./tegra-uboot-flasher", line 139, in func_flash
>      flash_img = args.flash_img
> AttributeError: 'Namespace' object has no attribute 'flash_img'

Hmm. Guess I never tested that:-) Applied, thanks.
