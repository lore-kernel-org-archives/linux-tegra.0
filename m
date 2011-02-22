From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/7] ARM: tegra: clock: Check for clk_num == 0
Date: Mon, 21 Feb 2011 21:29:08 -0800
Message-ID: <AANLkTikze+kvyKEYK2ZsKFjShSMROtt9ALbyH=8pXqbn@mail.gmail.com>
References: <1298342392-21236-1-git-send-email-ccross@android.com>
	<1298342392-21236-4-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1298342392-21236-4-git-send-email-ccross@android.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Cross <ccross@android.com>
Cc: linux-tegra@vger.kernel.org, konkers@android.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mike@compulab.co.il, Russell King <linux@arm.linux.org.uk>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 6:39 PM, Colin Cross <ccross@android.com> wrote=
:
> Peripheral clocks that have no clock enable bit in the
> enable registers have their clk_num set to 0. =A0Bit 0
> in the clock enable registers is the CPU clock.
> Prevent disables on these peripheral clocks from
> accidentally disabling the CPU clock.
>
> Signed-off-by: Colin Cross <ccross@android.com>

Acked-by: Olof Johansson <olof@lixom.net>

May I suggest a slightly more descriptive patch subject though? "ARM:
tegra: clock: prevent accidental disables of cpu clock" or similar,
maybe.


-Olof
