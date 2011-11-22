From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 5/5] arm/dt: tegra: Fix SDHCI nodes to match board files
Date: Tue, 22 Nov 2011 17:23:38 +0100
Message-ID: <20111122162338.GN21480@game.jcrosoft.org>
References: <1321911851-10091-1-git-send-email-swarren@nvidia.com>
 <1321911851-10091-5-git-send-email-swarren@nvidia.com>
 <20111122083802.GK21480@game.jcrosoft.org>
 <74CDBE0F657A3D45AFBB94109FB122FF174F08C3AF@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174F08C3AF-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08:12 Tue 22 Nov     , Stephen Warren wrote:
> Jean-Christophe PLAGNIOL-VILLARD wrote at Tuesday, November 22, 2011 1:38 AM:
> > On 14:44 Mon 21 Nov     , Stephen Warren wrote:
> > > Mark any SDHCI controllers that aren't registered by the board files as
> > > disabled in the device-tree files.
> > >
> > > In practice, these controllers:
> > >
> > > * Have nothing hooked up to them at all, or
> > > * For ports intended for SDIO usage, the drivers for anything that might
> > >   be attached are not in the device-tree yet. If/when drivers appear, the
> > >   SD/MMC port can be re-enabled.
> > >
> > > The only possible exception is TrimSlice's mico SD slot, but that wasn't
> > > enabled in the board files before anyway, and doesn't work when all the
> > > SDHCI controllers are enabled anyway.
> > it will be better to invert the logic
> > 
> > just enable what you are supposed too
> 
> It used to be that way when the files were first added, but they got
> switched around this way to match standard practice.
this is a bad practice because you can enable stuff that a hardware is not
supposed to use

and this silenty without anyone notice until you test the hardware

and you add more line and changeset

Best Regrds,
J.
