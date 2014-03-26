From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH] Add support for Jetson TK1 board
Date: Wed, 26 Mar 2014 16:23:11 -0600
Message-ID: <5333534F.4040200@wwwdotorg.org>
References: <1395769049-7996-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395769049-7996-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/25/2014 11:37 AM, Stephen Warren wrote:
> This board is currently disabled by default due to lack of U-Boot support
> in the mainline repository. If you wish to test this, do as follows:
> 
> cd ../u-boot
> git checkout some-branch-with-jetson-tk1-support
> cd ../scripts
> ./build --boards venice2 build

Applied.
