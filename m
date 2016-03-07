From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 3/4] Add option --signed
Date: Mon, 7 Mar 2016 13:31:57 -0700
Message-ID: <56DDE53D.4060206@wwwdotorg.org>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-4-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457135087-967-4-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/04/2016 04:44 PM, Jimmy Zhang wrote:
> This option allows user to specify and download signed rcm messages and bootloader
> to device. This option must come along with option "--miniloader".
>
> Example:
> $ sudo ./tegrarcm --miniloader t124_ml_rcm.bin --signed --bct test.bct --bootloader u-boo

I won't review this patch in detail since I expect it will change quite 
a bit to implement 3 modes of operation:

a) Create signed files, don't interact with HW.
b) Read signed files, send them to HW.
c) Sign data on-the-fly, while sending it to HW.
