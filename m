From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] sdhci: tegra: Remove warnings about missing
 device-tree properties
Date: Tue, 19 May 2020 17:05:27 +0300
Message-ID: <b634e7a5-9a30-3bd1-126d-be62e4dd73e1@gmail.com>
References: <20200516154314.14769-1-digetx@gmail.com>
 <CAPDyKFo_Xp-zipqE26iMv4CFwUoMCQZy3Zr63Cp=uzePgWX7BA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFo_Xp-zipqE26iMv4CFwUoMCQZy3Zr63Cp=uzePgWX7BA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

19.05.2020 10:28, Ulf Hansson пишет:
> On Sat, 16 May 2020 at 17:44, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Several people asked me about the MMC warnings in the KMSG log and
>> I had to tell to ignore them because these warning are irrelevant to
>> pre-Tegra210 SoCs.
> 
> Why are the warnings irrelevant?

That's what the DT binding doc says [1].

[1]
https://www.kernel.org/doc/Documentation/devicetree/bindings/mmc/nvidia%2Ctegra20-sdhci.txt

Although, looking at the driver's code and TRM docs, it seems that all
those properties are really irrelevant only to the older Terga20 SoC. So
the binding doc is a bit misleading.

Nevertheless, the binding explicitly says that the properties are
optional, which is correct.

>> It should be up to a board's device-tree writer to
>> properly describe all the necessary properties. Secondly, eventually all
>> device-tree bindings will be converted to YAML, which allows to validate
>> board DT files, giving a warning about missing properties. Hence let's
>> remove the noisy warnings to stop the confusion.
> 
> Yep, makes sense. However, perhaps we should do this conversion then,
> rather than first drop the warnings?

I don't mind to postpone this patch. But again, IIUC, all these
properties are optional, and thus, there is no critical need to verify
them in DT right now, it could be done later on.
