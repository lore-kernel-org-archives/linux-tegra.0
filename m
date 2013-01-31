From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 4/5] drm/tegra: Implement VBLANK support
Date: Thu, 31 Jan 2013 09:17:58 +0100
Message-ID: <CAKMK7uHfaB=rNKjmMMRRSUsu9yqrzhe7sUrG2RiezRoiq4V6-Q@mail.gmail.com>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
	<1358178932-25505-5-git-send-email-thierry.reding@avionic-design.de>
	<CADWT_cPtdmSF+_ybe70ZY_z5idzr0KQe94r57ok-Hf-V22wixA@mail.gmail.com>
	<20130130083453.GA21322@avionic-0098.mockup.avionic-design.de>
	<CAKMK7uHo9inMzKXqpnH9+H7Tm+nnChGUXE+mGA51L0fNrwoX0Q@mail.gmail.com>
	<5109D1A1.9010207@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5109D1A1.9010207-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Mayo <jon-MQ+mZzckBGs@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 31, 2013 at 3:06 AM, Mario Kleiner
<mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> wrote:
> At least AMD hw as of a while ago didn't, older intel hw didn't (afaik), and
> NVidia i don't know. You'd also need hw vblank timestamps and counters
> independent of page-flip completion to not regress existing important
> functionality if you want to get rid of the irq based method.

Intel hw has counters+timestamps for pageflips and vblanks, so you get
the cake and eat it, too. I'm also aware of your stringent
requirements wrt timestamps, so the recently pimped kms_flip test we
have for drm/i915.ko checks vblank timestamps, pageflip timestamps and
whether those don't get out of sync somehow in a rather anal way.
Results thus far is that the current vblank stuff is (at least for
intel) pretty horribly broken - QA reported random and sometimes
not-so-random failures across all generations.

So we still have plenty of fixing to do until we can get around to
implement pageflip timestamping without the irq vblank running all the
time.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
