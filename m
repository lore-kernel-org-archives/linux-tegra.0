From: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V4 2/4] ARM: tegra: pcie: Add tegra3 support
Date: Tue, 11 Jun 2013 10:17:52 +0530
Message-ID: <C79B248886DD134989C8FF6B096A91AB91B616BEEE@BGMAIL01.nvidia.com>
References: <1370445221-17696-1-git-send-email-jagarwal@nvidia.com>
 <51AF68F1.8080307@wwwdotorg.org> <20130610200906.GD25859@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130610200906.GD25859@mithrandir>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Thierry Reding' <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Juha Tukkinen <jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krishna Thota <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


> * PGP Signed by an unknown key
> 
> On Wed, Jun 05, 2013 at 10:36:01AM -0600, Stephen Warren wrote:
> > On 06/05/2013 09:13 AM, Jay Agarwal wrote:
> > > - Make private data structure for each SoC
> > > - Add required Tegra30 clocks and regulators
> > > - Add Tegra30 specific code in enable controller
> > > - Added Tegra30 specific properties in pci binding document
> >
> > It's a bit odd to send an updated version of just some of the patches;
> > reposting a whole series is much easier for the person applying the
> > patches. However, hopefully Thierry can handle it in this case.
> 
> Yes, I think I can handle it. It might be good to have Jay look at the final
> patches when I'm done, though, to make sure I haven't forgotten anything.
> 
Yes, please let me know whenever you have integrated my patches to your repo, so that I can sync, review & verify again.
