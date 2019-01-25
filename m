From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V2 3/4] i2c: tegra: Add DMA Support
Date: Sat, 26 Jan 2019 01:09:19 +0300
Message-ID: <42d20b67-95a7-c4c3-059e-0b990e6f684f@gmail.com>
References: <1548363113-25969-1-git-send-email-skomatineni@nvidia.com>
 <1548363113-25969-3-git-send-email-skomatineni@nvidia.com>
 <dcc1e094-638e-5b04-7a61-bdbc24ee068f@gmail.com>
 <BYAPR12MB339829FC6F2F95F833FE45A1C29B0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <ad177c2e-3801-ddad-b359-ac83530ee1d6@gmail.com>
 <BYAPR12MB33982ED3A9EC34819D2490F8C29B0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <782dcecf-2991-e886-af18-d355a3ea8325@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <782dcecf-2991-e886-af18-d355a3ea8325@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

26.01.2019 0:49, Dmitry Osipenko пишет:

> 3) After applying these patches I2C transfers are failing on Tegra20 with "tegra-i2c 7000c400.i2c: Failed to allocate the DMA buffer". 
> 

Actually scratch the above, turned out I haven't applied patches correctly. In fact patches are failing to apply with:

# git apply --verbose V2-3-4-i2c-tegra-Add-DMA-Support.patch
Checking patch drivers/i2c/busses/i2c-tegra.c...
Hunk #4 succeeded at 198 (offset 3 lines).
Hunk #5 succeeded at 212 (offset 3 lines).
Hunk #6 succeeded at 229 (offset 3 lines).
Hunk #7 succeeded at 243 (offset 3 lines).
Hunk #8 succeeded at 321 (offset 3 lines).
Hunk #9 succeeded at 636 (offset 3 lines).
Hunk #10 succeeded at 751 (offset 3 lines).
Hunk #11 succeeded at 798 (offset 3 lines).
Hunk #12 succeeded at 968 (offset 3 lines).
Hunk #13 succeeded at 996 (offset 3 lines).
Hunk #14 succeeded at 1050 (offset 3 lines).
Hunk #15 succeeded at 1075 (offset 3 lines).
Hunk #16 succeeded at 1125 (offset 3 lines).
Hunk #17 succeeded at 1180 (offset 3 lines).
Hunk #18 succeeded at 1304 (offset 13 lines).
error: while searching for:
                return -ENOMEM;

        i2c_dev->base = base;
        i2c_dev->div_clk = div_clk;
        i2c_dev->adapter.algo = &tegra_i2c_algo;
        i2c_dev->adapter.quirks = &tegra_i2c_quirks;
        i2c_dev->irq = irq;
        i2c_dev->cont_id = pdev->id;
        i2c_dev->dev = &pdev->dev;

        i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
        if (IS_ERR(i2c_dev->rst)) {

error: patch failed: drivers/i2c/busses/i2c-tegra.c:1000
error: drivers/i2c/busses/i2c-tegra.c: patch does not apply


Please use "git format-patch -4 xxxx" and do not edit patches manually.
