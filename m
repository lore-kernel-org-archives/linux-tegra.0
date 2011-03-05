From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra ASoC board patches for 2.6.39
Date: Fri, 4 Mar 2011 21:39:05 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF045687B7AC@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Friday, March 04, 2011 5:12 PM:
> On Fri, Mar 4, 2011 at 1:32 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Olof Johansson wrote at Thursday, March 03, 2011 6:01 PM:
> >> I can do them (sorry, been out today and was also waiting on the i2c
> >> merge to land).
> >>
> >> I'll take them through my tree with the i2c changes. I'll post the
> >> base i2c board changes either tonight or tomorrow morning, after that
> >> Stephens can easily go on top.
> >
> > Olof,
> >
> > I didn't see any updates in git.
> >
> > Do my changes still need to be in today? I'm assuming you wanted me to
> > rebase my changes on top of your I2C changes one they were published,
> > and mail the patches again...
> 
> I've got the changes staged, but the i2c core is spewing errors about
> lack of suitable probing methods that I'm investigating before
> posting.

OK. I've got 5 basic patches, in git log order:

4242867 ARM: tegra: Harmony: Set WM8903 gpio_base
ee30f0d ARM: tegra: Harmony: I2C-related portions of audio support
eb1908c ARM: tegra: Harmony: Beginnings of audio support
00a389d ARM: Tegra: Create defines for SD-related GPIO names
3ded79e ARM: Tegra: Add devices.c entries for audio

The first 3 can be applied to your boards-for-next. The next is appropriate
for boards-for-next-i2c, but only after that includes the first 3. The final
patch relies on the latest ASoC code, plus previous patches.

I'm going to post these as two series, depending on how you want to merge
them:

* A series based on the current boards-for-next-i2c which includes
  everything.

* A series based on the current boards-for-next which only includes the first
  3 patches. The idea being you could apply these now, then rebuild
  boards-for-next-i2c on top of the modified boards-for-next, then apply the
  remaining two patches from the first series ther.

Note that while I did test the original patches, I cherry-picked those and
fixed up merge conflicts to generate these patch series. I have not yet tested
these modified patches on real HW. I can do so on Monday if you want. I did
test that each patch in turn in each series does compile without issue.

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
