From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V19 1/7] i2c: tegra: sort all the include headers
 alphabetically
Date: Wed, 13 Feb 2019 00:15:13 +0300
Message-ID: <cdb66da2-4886-e3ba-e78e-264bd4b5b73c@gmail.com>
References: <1549998408-9137-1-git-send-email-skomatineni@nvidia.com>
 <de27b8f8-ba8e-fca7-6bdc-cdd580d959e6@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <de27b8f8-ba8e-fca7-6bdc-cdd580d959e6@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "mkarthik@nvidia.com" <mkarthik@nvidia.com>, "smohammed@nvidia.com" <smohammed@nvidia.com>, "talho@nvidia.com" <talho@nvidia.com>
Cc: "wsa@the-dreams.de" <wsa@the-dreams.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

13.02.2019 0:00, Peter Rosin пишет:
> On 2019-02-12 20:06, Sowjanya Komatineni wrote:
>> This patch sorts all the include headers alphabetically for the
>> I2C Tegra driver.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  [V9/V10/V11/V12/V13/V14/V15/V16/V17/V18/V19] : Rebased to 5.0-rc4
>>  [V3/V4/V5/V7/V8] : Removed unsued headers in tegra I2C
> 
> "^ Header removal should be mentioned in the commit message, I think."
> - Wolfram Sang [0]
> 
> Cheers,
> Peter
> 
> [0] https://lkml.org/lkml/2019/2/11/375
> 

It could make sense to adjust the comment only if there will be anything else worthwhile a new revision, otherwise it is not-so-important. 
