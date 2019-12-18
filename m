From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] brcmfmac: Keep OOB wake-interrupt disabled when it
 shouldn't be enabled
Date: Wed, 18 Dec 2019 22:11:58 +0300
Message-ID: <9217d183-69ec-8be1-217e-0e4d67710743@gmail.com>
References: <20191215184224.11827-1-digetx@gmail.com>
 <20191218190920.C0B97C4479F@smtp.codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191218190920.C0B97C4479F@smtp.codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.12.2019 22:09, Kalle Valo пишет:
> Dmitry Osipenko <digetx@gmail.com> wrote:
> 
>> NVIDIA Tegra SoCs do not like when OOB wake is enabled and WiFi interface
>> is in DOWN state during suspend. This results in a CPU hang on programming
>> OOB wake-up state of the GPIO controller during of system's suspend.
>>
>> The solution is trivial: don't enable wake for the OOB interrupt when it
>> should be disabled.
>>
>> This fixes hang on Tegra20 (Acer A500) and Tegra30 (Nexus 7) devices which
>> are using BCM4329 and BCM4330 WiFi chips respectively.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Patch applied to wireless-drivers-next.git, thanks.
> 
> a32de68edab7 brcmfmac: Keep OOB wake-interrupt disabled when it shouldn't be enabled
> 

Thank you very much!
