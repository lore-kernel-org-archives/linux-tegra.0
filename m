From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] tegra/mmc: add pm_flags
Date: Fri, 25 Mar 2011 17:38:40 -0700
Message-ID: <BANLkTimyxA0iT9c7gAkoDVSNUWM+Jz_OyA@mail.gmail.com>
References: <20110326000712.DD5D3208182@grundler.mtv.corp.google.com>
	<m3wrjmk9pk.fsf@pullcord.laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <m3wrjmk9pk.fsf@pullcord.laptop.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Chris Ball <cjb@laptop.org>
Cc: Grant Grundler <grundler@google.com>, Colin Cross <ccross@android.com>, Erik Gilling <konkers@android.com>, linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, grundler@chromium.org, vrao@broadcom.com
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 25, 2011 at 5:27 PM, Chris Ball <cjb@laptop.org> wrote:
> Hi,
>
> On Fri, Mar 25 2011, Grant Grundler wrote:
>> Enable fast bcm4329 WIFI suspend/resume on Tegra2 board.
>>
>> This part allows the mach-tegra support tell the tegra MMC host controller
>> to NOT turn off power for the MMC controller the WIFI part lives behind.
>> Thus bcm4329 firmware doesn't need to be reloaded.
>>
>> Signed-off-by: Venkat Rao <vrao@broadcom>
>> Tested-by: Grant Grundler <grundler@chromium.org>
>> Reviewed-by: Olof Johansson <olofj@chromium.org>
>> ----
>> I'm not certain if this should go through tegra or mmc tree.
>> Can you advise please?
>
> I'm happy to take it through the MMC tree for .40, but would like
> an Acked-by: from an arch/arm/mach-tegra maintainer to show Linus.
> Olof is one such person, so getting an Acked-by from him would work.
>
> (Also, Venkat's e-mail address is malformed in the S-o-b.)

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
