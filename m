From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 4/7] ARM: tegra: Move tegra_common_init to tegra_init_early
Date: Mon, 21 Feb 2011 21:30:34 -0800
Message-ID: <AANLkTi=WF_i46ONPf9N+=qdZA0mkP4P4QQO79Amb54CD@mail.gmail.com>
References: <1298342392-21236-1-git-send-email-ccross@android.com>
	<1298342392-21236-5-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1298342392-21236-5-git-send-email-ccross@android.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Cross <ccross@android.com>
Cc: linux-tegra@vger.kernel.org, konkers@android.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mike@compulab.co.il, Russell King <linux@arm.linux.org.uk>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 6:39 PM, Colin Cross <ccross@android.com> wrote:
> Move tegra_common_init to tegra_init_early, and set it
> as the init_early entry in the machine struct.
> Initializes the clocks earlier so that timers can enable
> their clocks.
>
> Also reorders the members in the Harmony and Trimslice
> boards' machine structs to match the order they are
> called in.
>
> Signed-off-by: Colin Cross <ccross@android.com>

Acked-by: Olof Johansson <olof@lixom.net>

Please push this ASAP so I can rebase my series, even if some of the
others might need respin. :)


-Olof
