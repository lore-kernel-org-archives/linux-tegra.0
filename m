From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH v1 0/3] Add support for LP3
Date: Thu, 26 Jan 2012 13:49:00 -0800
Message-ID: <CAMbhsRQips51u_hB0-xMdFsSPCCxsehXiiSVx0D5KZxQRwTT0A@mail.gmail.com>
References: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Russell King <linux@arm.linux.org.uk>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 8:22 AM, Peter De Schrijver
<pdeschrijver@nvidia.com> wrote:
> Introduce support for LP3 (CPU core clockgating) for Tegra20 and Tegr=
a30.
>
> Peter De Schrijver (3):
> =A0ARM: tegra: definitions for flow controller
> =A0ARM: tegra: assembler code for LP3
> =A0ARM: tegra: cpuidle driver for tegra
>
> =A0arch/arm/mach-tegra/Makefile =A0 | =A0 =A02 +
> =A0arch/arm/mach-tegra/cpuidle.c =A0| =A0107 ++++++++++++++++++++++++=
++++++++++++++++
> =A0arch/arm/mach-tegra/flowctrl.h | =A0 37 ++++++++++++++
> =A0arch/arm/mach-tegra/sleep.S =A0 =A0| =A0 91 ++++++++++++++++++++++=
++++++++++++
> =A04 files changed, 237 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-tegra/cpuidle.c
> =A0create mode 100644 arch/arm/mach-tegra/flowctrl.h
> =A0create mode 100644 arch/arm/mach-tegra/sleep.S

=46or the series,
Acked-by: Colin Cross <ccross@android.com>
