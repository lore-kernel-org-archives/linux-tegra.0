From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 0/6] Tegra branches for 3.4
Date: Mon, 5 Mar 2012 17:02:37 +0000
Message-ID: <201203051702.38188.arnd@arndb.de>
References: <1330892042-32065-1-git-send-email-olof@lixom.net> <CAOesGMgahK_wkM1PGb55D1gEzbYfJVQKO_XSqMPbw5wTP09Fag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgahK_wkM1PGb55D1gEzbYfJVQKO_XSqMPbw5wTP09Fag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sunday 04 March 2012, Olof Johansson wrote:
> On Sun, Mar 4, 2012 at 12:13 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> > Hi Arnd,
> >
> > Below are the 6 pull requests for Tegra platforms for 3.4. This is also
> > likely my last merge request for tegra material (besides possibly some
> > stray patches between now and the merge window), since I am handing off
> > main maintainership to Stephen Warren for the next merge window.
> >
> > Each branch is documented in the tag (they are all tag pull requests), as
> > well as in the emails below. Nothing too controversial.
> 
> Oh, I did forget to mention one added dependency: The soc-drivers
> branch has a dependency on Grant's irq_domain branch -- not for
> merging but for building.

Yes, I saw that in the tag description. I had included it in the tegra/soc-drivers
branch, but not in the next/drivers branch, which I did now.

	Arnd
