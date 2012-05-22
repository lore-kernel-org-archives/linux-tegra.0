From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Unifying device tree filenames, and U-Boot SoC name
Date: Mon, 21 May 2012 18:01:43 -0700
Message-ID: <20120522010143.GF30009@nvidia.com>
References: <4FB3E788.2040801@wwwdotorg.org>
 <20120521142214.GC21513@avionic-0098.mockup.avionic-design.de>
 <CAPnjgZ3rcprV5Es3Omcnwr8EdvP+1E94U__Ou_9wzw1048beNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ3rcprV5Es3Omcnwr8EdvP+1E94U__Ou_9wzw1048beNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 21, 2012 at 05:49:03PM -0700, Simon Glass wrote:
> Hi Stephen,
> 
> On Mon, May 21, 2012 at 7:22 AM, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org<mailto:thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>> wrote:
> * Stephen Warren wrote:
> >
> > b) In U-Boot, rename the tegra2 support to tegra20 so that U-Boot ends
> > up setting board_soc=tegra20, so this matches the .dts/.dtb filenames.
> > This would involve renaming arch/arm/cpu/armv7/tegra2/ to
> > ./arch/arm/cpu/armv7/tegra20/ and editing boards.cfg to match, and
> > possibly other related changes.
> >
> > This sounds like churn, but I think we could easily fold this into
> > Allen's series that moves the tegra2 directory in order to put it in a
> > common place for separate SPL/non-SPL builds to avoid doing this kind of
> > thing multiple times.
> >
> > Does anyone think this is a good/bad/... idea? Thanks.
> 
> I like it. It's better to have the names consistent.
> 
> Sounds good to me, too.

I'm fine with the proposal, I'll roll it into my SPL patch series
which I need to post a new version of anyway.

-Allen
-- 
nvpublic
