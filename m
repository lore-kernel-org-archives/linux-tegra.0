From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 0/6] Tegra branches for 3.4
Date: Sun, 4 Mar 2012 12:41:51 -0800
Message-ID: <CAOesGMgahK_wkM1PGb55D1gEzbYfJVQKO_XSqMPbw5wTP09Fag@mail.gmail.com>
References: <1330892042-32065-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330892042-32065-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Mar 4, 2012 at 12:13 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Hi Arnd,
>
> Below are the 6 pull requests for Tegra platforms for 3.4. This is also
> likely my last merge request for tegra material (besides possibly some
> stray patches between now and the merge window), since I am handing off
> main maintainership to Stephen Warren for the next merge window.
>
> Each branch is documented in the tag (they are all tag pull requests), as
> well as in the emails below. Nothing too controversial.

Oh, I did forget to mention one added dependency: The soc-drivers
branch has a dependency on Grant's irq_domain branch -- not for
merging but for building.


-Olof
