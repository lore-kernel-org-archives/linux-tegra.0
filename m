From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 02/10] ARM: tegra: export Tegra chipid
Date: Mon, 20 Feb 2012 15:30:11 -0800
Message-ID: <CAOesGMi=nsKr91uu=QTpJ_vKKhc9GBRHPWd6XEB+rOqph_P+yA@mail.gmail.com>
References: <1328831277-21002-1-git-send-email-pdeschrijver@nvidia.com>
	<1328831277-21002-3-git-send-email-pdeschrijver@nvidia.com>
	<CAMbhsRT-ZTh7WQ1E0NUjX8FOMGAvx5zNnB-VYD=j8sWhM-9j+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMbhsRT-ZTh7WQ1E0NUjX8FOMGAvx5zNnB-VYD=j8sWhM-9j+A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Cross <ccross@android.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Warren <swarren@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Gary King <gking@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Mon, Feb 20, 2012 at 3:13 PM, Colin Cross <ccross@android.com> wrote:

> Other platforms use accessors for this (cpu_is_xxx(), although
> soc_is_xxx() is probably more appropriate).

I have previously objected to additions of said functions on tegra,
since they tend to start crawling into drivers as runtime tests
instead of providing more appropriate detection at probe time.

I can be persuaded differently but I haven't yet seen a strong case
for changing my mind. :)


-Olof
