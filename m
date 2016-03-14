From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH V2 4/4] Add option --usb-timeout=<value>
Date: Mon, 14 Mar 2016 12:31:13 -0600
Message-ID: <56E70371.7040607@wwwdotorg.org>
References: <1457744552-30966-1-git-send-email-jimmzhang@nvidia.com>
 <1457744552-30966-5-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457744552-30966-5-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/11/2016 06:02 PM, Jimmy Zhang wrote:
> RCM communication sometimes fails if the USB timeout is short. The default
> timeout is 1000ms. Increase the timeout value to avoid this issue. The exact
> cause is not yet diagnosed.

This patch has been modified to add a cmdline option to specify the 
timeout, rather than increasing the default timeout, so the commit 
description needs to be updated.
