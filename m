From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Patches for 2.6.39 merge window
Date: Tue, 22 Feb 2011 12:48:46 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A5AE2@HQMAIL01.nvidia.com>
References: <AANLkTinK4oCbvDNPDFUjpB8qTBZiWfx3CkUuyuTLyVsx@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinK4oCbvDNPDFUjpB8qTBZiWfx3CkUuyuTLyVsx-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mark Brown (broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org)" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin Cross wrote at Tuesday, February 22, 2011 1:18 PM:
> 2.6.38-rc6 is out, and everything that will be posted for the 2.6.39
> merge window should be in, with a few exceptions.  I still intend to
> merge Olof's Seaboard patch set and Stephen's audio clock patch set,

There are a few small other additions needed for the audio drivers;
a few pinmux edits and a couple small pieces of platform data to
pass to the audio machine and codec drivers. I hope to post these
ASAP, as soon as I can rebase them on top of the latest Tegra for-next
and perform a little testing.

One small issue I did notice though:

In the ASoC for-2.6.39 tree, I added a field to the wm8903 platform data
that's needed to support the new gpiolib functionality I added to the wm8903
driver. This header update is only in the ASoC tree right now. I'm not sure
quite how to handle this, since the Tegra tree will need that header update
in order to fully define the wm8903 platform data.

I think what we should have done is added that header patch to ASoC's
tegra-arch branch and merged it into the Tegra tree like harmony_audio.h.
However I forgot that would be needed, so it's too late now.

Should we handle it like this: Check in all the platform data to Tegra
for-next, but with that one new field removed or commented out. Wait until
the merge window is open for 2.6.39 (or 2.6.39-rc1 is released), and hence
Tegra for-next/for-linus can merge from Linus' tree to pick up the new
wm8903.h, then add or uncomment that one field in the platform data?

CC'ing Mark Brown to comment on that too.

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
