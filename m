From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH v2 09/21] ARM: tegra: clock: Move unshared clk struct
 members into union
Date: Sun, 20 Feb 2011 23:00:22 -0800
Message-ID: <AANLkTinzjKd2gT9v73hczQ__35+V5LB7puD8ATuZxJD0@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
	<1298154371-5641-11-git-send-email-ccross@android.com>
	<AANLkTi=1Sxsa7ZwUSX6NK2M5Sp3Ww20CumCrividGsrx@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=1Sxsa7ZwUSX6NK2M5Sp3Ww20CumCrividGsrx@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, konkers@android.com, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Feb 20, 2011 at 8:10 PM, Olof Johansson <olof@lixom.net> wrote:
> On Sat, Feb 19, 2011 at 2:25 PM, Colin Cross <ccross@android.com> wrote:
>> Signed-off-by: Colin Cross <ccross@android.com>
>
> Same here, short description. With that:
>
> Acked-by: Olof Johansson <olof@lixom.net>
>

I will add:
Creates a union of a struct for each type of clock to reduce memory
usage and clarify which members are used by all clocks and which are
used by a single type.
