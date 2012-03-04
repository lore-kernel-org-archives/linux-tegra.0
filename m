From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 0/6] Tegra branches for 3.4
Date: Sun, 4 Mar 2012 21:27:52 +0000
Message-ID: <201203042127.53017.arnd@arndb.de>
References: <1330892042-32065-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330892042-32065-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sunday 04 March 2012, Olof Johansson wrote:
> Hi Arnd,
> 
> Below are the 6 pull requests for Tegra platforms for 3.4. This is also
> likely my last merge request for tegra material (besides possibly some
> stray patches between now and the merge window), since I am handing off
> main maintainership to Stephen Warren for the next merge window.
> 
> Each branch is documented in the tag (they are all tag pull requests), as
> well as in the emails below. Nothing too controversial.
> 
> There are a handful of trivial merge conflicts between the branches,
> mostly to the Makefile due to context chances. I also had a local
> issue where git auto-resolved the merge of the T30 SMP branch into
> my for-next branch, and did NOT remove the mach/system.h include at
> arch/arm/mach-tegra/common.c. This results in a build break since it
> has been removed in rmk/for-armsoc. So just a heads up in case you see
> the same thing.

Hi Olof,

I've pulled them all into the respective branches. I'll send out a
status of all the stuff (and missing stuff) in arm-soc.git tomorrow
and then hand back over to you for a while until you need to shift
your own focus again.

	Arnd
