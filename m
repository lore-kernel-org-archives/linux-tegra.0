From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH 2/2] Add config files for Venice2 board
Date: Wed, 11 Sep 2013 17:51:06 -0600
Message-ID: <523101EA.7020704@wwwdotorg.org>
References: <1378943336-9263-1-git-send-email-swarren@wwwdotorg.org> <1378943336-9263-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378943336-9263-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/11/2013 05:48 PM, Stephen Warren wrote:
> This board is currently disabled by default due to lack of U-Boot support
> in the mainline repository. If you wish to test this, do as follows:
> 
> cd u-boot
> git checkout some-branch-with-venice2-support
> cd ../scripts
> ./build --boards venice2 build

Peter, do you have a Venice2 yet? If so, could I trouble you to apply
the tegrarcm Tegra124 support patches from Allen, the cbootimage-configs
and tegra-uboot-flasher-scripts patches from me, grab a downstream
Venice2 U-Boot branch, and validate that it all works?

If not, perhaps I could persuade Allen or someone else to do it.

Thanks!
