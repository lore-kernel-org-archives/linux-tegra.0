From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 01/21] ARM: tegra: clock: enable clk reset for
 non-peripheral clocks
Date: Sun, 20 Feb 2011 20:05:29 -0800
Message-ID: <AANLkTimOX62Qm4DsjjevCotj8ULrqYvSm_TuM3gpY2r=@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
	<1298154371-5641-3-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1298154371-5641-3-git-send-email-ccross@android.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Cross <ccross@android.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, konkers@android.com, Dima Zavin <dima@android.com>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Feb 19, 2011 at 2:25 PM, Colin Cross <ccross@android.com> wrote:
> From: Dima Zavin <dima@android.com>
>
> Add a new 'reset' clk op. This can be provided for any clock,
> not just peripherals.
>
> Signed-off-by: Dima Zavin <dima@android.com>
> Signed-off-by: Colin Cross <ccross@android.com>

Acked-by: Olof Johansson <olof@lixom.net>
