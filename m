From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [RESEND RESEND PATCH] arm/arm64: defconfig: Update configs to use
 the new CROS_EC options
Date: Fri, 17 Jul 2020 11:37:47 +0200
Message-ID: <2c7a9b5f-968b-38a2-3f67-f731a8617e09@collabora.com>
References: <20200305111047.147355-1-enric.balletbo@collabora.com>
 <CAFqH_52LhfV9AsnPRZi_ZPsgYX8WrUrKEsV-E7VHOw3ZZtHd-w@mail.gmail.com>
 <CAK8P3a0ScHe+ErEZr-x4Sj=3Yz7cppKDcemXemvwXMbPh-RVMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0ScHe+ErEZr-x4Sj=3Yz7cppKDcemXemvwXMbPh-RVMQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Gwendal Grignou <gwendal@chromium.org>, Collabora Kernel ML <kernel@collabora.com>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Amelie Delaunay <amelie.delaunay@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Dmitry Osipenko <digetx@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Anson Huang <Anson.Huang@nxp.com>, Lee Jones <lee.jones@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell
List-Id: linux-tegra@vger.kernel.org

Hi Arnd,

On 17/7/20 8:59, Arnd Bergmann wrote:
> On Wed, Jul 15, 2020 at 11:31 PM Enric Balletbo Serra
> <eballetbo@gmail.com> wrote:
>> Missatge de Enric Balletbo i Serra <enric.balletbo@collabora.com> del
>> dia dj., 5 de març 2020 a les 12:11:
>>>
>>> We refactored the CrOS EC drivers moving part of the code from the MFD
>>> subsystem to the platform chrome subsystem. During this change we needed
>>> to rename some config options, so, update the defconfigs accordingly.
>>>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>>> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
>>> Tested-by: Gwendal Grignou <gwendal@chromium.org>
>>> Acked-by: Lee Jones <lee.jones@linaro.org>
>>> ---
>>
>> A gentle ping. I'd like to land this if is possible because that way I
>> can remove some legacy code in platform/chrome subsystem.
>>
>> Thanks,
>>   Enric
>>
>>> Dear all,
>>>
>>> This is a resend of a resend patch [3]. In some previous discussions
>>> maintainers would prefer to have this merged through the arm-soc tree
>>> but wasn't merged yet and I forget to ping again, hence, sending a new
>>> resend.
> 
> I've merged it into the arm/defconfig branch of the soc tree now.
> If you have future platform specific changes to the defconfig files,
> please just add soc@kernel.org to the recipients to get the patch
> into patchwork.
> 

Many thanks! I'll take into account this next time.

>      Arnd
> 
