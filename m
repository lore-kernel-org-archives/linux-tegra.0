From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v4 3/4] gpio/tegra: Convert to a platform device
Date: Wed, 12 Oct 2011 15:49:09 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE19F15@HQMAIL01.nvidia.com>
References: <1318371375-4083-1-git-send-email-swarren@nvidia.com>
 <1318371375-4083-3-git-send-email-swarren@nvidia.com>
 <20111012224131.GD25128@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111012224131.GD25128-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, October 12, 2011 4:42 PM:
> On Tue, Oct 11, 2011 at 04:16:14PM -0600, Stephen Warren wrote:
> > v3: Make regs variable static. Remove empty init of tegra_gpio_banks.
> >
> > v2: Retrieve IRQ and memory addresses from resources instead of hard-
> > coding them. Add back initialization of tegra_gpio_chip.of_node.
> 
> In the future, please move the revision log to below the ---, and just have
> the main patch description above, since that is what goes into the git repo.

I don't quite recall when or exactly which Linux-related mailing list I
saw it on, but I saw a discussion on this topic, and people pointed out
that having the revision log in the git commit message actually has some
advantages; it documents some of the things that were though about during
the review, and ends up documenting which version of the patch actually
ended up in git.

Besides, it's a lot easier to maintain the changelog in the git commit
description than in some out-of-band location:-) Although I guess I
could edit the files after git format-patch.

So, I wonder if it might be a good idea to check the changelog in?

-- 
nvpublic
