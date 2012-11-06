From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] ARM: tegra: fixes for 3.7-rc4
Date: Tue, 6 Nov 2012 07:36:35 -0800
Message-ID: <20121106153635.GC30580@quad.lixom.net>
References: <1351784594-28982-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1351784594-28982-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 01, 2012 at 09:43:14AM -0600, Stephen Warren wrote:
> Here we have just a single fix for the Tegra30 pinctrl module's register
> range size in device tre.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit 8f0d8163b50e01f398b14bcd4dc039ac5ab18d64:
> 
>   Linux 3.7-rc3
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.7-fixes-for-rc4
> 
> for you to fetch changes up to 322337b8fbd8c392246529d5db924820fc0c7381:
> 
>   ARM: dt: tegra: fix length of pad control and mux registers

Hi,

Looks like tegra-for-3.7-fixes-for-rc4 is not in that repo, but I did find
a for-3.7/fixes-for-rc4 with the same contents, which I pulled.


-Olof
