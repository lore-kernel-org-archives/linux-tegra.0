From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: tegra: PCI-e improvements
Date: Thu, 3 Mar 2011 14:17:23 -0800
Message-ID: <AANLkTimmBAv1jpDyJXGpbSHo7pN-R2s1iZChdiP_y706@mail.gmail.com>
References: <cover.1299068166.git.mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1299068166.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 2, 2011 at 4:34 AM, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> wro=
te:
> Hi all,
> This patches add PCI-e powergating support and fix for TrimSlice PCI-=
e initialization in the mutliplatform kernels.
>
> The patches are also available at git repository
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux-tegra.git=
 trimslice/upstream
>
> The following changes since commit ccac05152e7c6a8103b9e7a801bc995180=
a800fc:
>
> =A0ARM: Tegra: DMA: Fail safe if initialization fails (2011-02-23 14:=
06:03 -0800)
>
> Mike Rapoport (3):
> =A0ARM: tegra: PCIE minor code refactoring
> =A0ARM: tegra: add PCI Express power gating
> =A0ARM: tegra: trimslice: initialize PCI-e only when running on
> =A0 =A0TrimSlice
>
> =A0arch/arm/mach-tegra/board-trimslice.c | =A0 =A03 ++
> =A0arch/arm/mach-tegra/pcie.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 38 +++++++=
+++++++++++++++++--------
> =A02 files changed, 31 insertions(+), 10 deletions(-)

Ack - I put all 3 in tegra for-next.  With these patches, I can boot
my board with Trimslice and pci compiled in.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
