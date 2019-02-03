From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Sun, 3 Feb 2019 19:48:09 +0300
Message-ID: <a5e79739-3ce5-6c22-c9d2-e9d2c709cb30@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
 <d37e901b-1c26-3d9c-7f68-29e06f4ff993@gmail.com>
 <BYAPR12MB33982BC5A58A000A0CB84F6AC2930@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33982BC5A58A000A0CB84F6AC2930@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

02.02.2019 21:32, Sowjanya Komatineni пишет:
>>> This patch adds DMA support for Tegra I2C.
>>>
>>> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for 
>>> transfer size of the max FIFO depth and DMA mode is used for transfer 
>>> size higher than max FIFO depth to save CPU overhead.
>>>
>>> PIO mode needs full intervention of CPU to fill or empty FIFO's and 
>>> also need to service multiple data requests interrupt for the same 
>>> transaction. This adds delay between data bytes of the same transfer 
>>> when CPU is fully loaded and some slave devices has internal timeout 
>>> for no bus activity and stops transaction to avoid bus hang. DMA mode 
>>> is helpful in such cases.
>>>
>>> DMA mode is also helpful for Large transfers during downloading or 
>>> uploading FW over I2C to some external devices.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>
>>
>>> +static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev) {
>>> +	struct dma_chan *dma_chan;
>>> +	u32 *dma_buf;
>>> +	dma_addr_t dma_phys;
>>> +	int err = 0;
>>> +
>>> +	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
>>> +		return -ENODEV;
>>
>> Another detail is that we need to keep older kernels working on T186+ after its device-tree will get the "dmas" property, device-tree changes shall be backwards-compatible with older kernels. Hence we need to check that platform actually wants the APB DMA driver, otherwise T186+ will be failing with -EPROBE_DEFER.
> 
> Yes, that will be a separate patch later for adding DMA support for Tegra186 and later chips once we check on GPCDMA upstream
> 
> 

Sure, and there is a requirement in upstream to keep older kernel versions working with the later device-tree updates, as I pointed above. Please include the ".has_apb_dma checking" that I'm suggesting into the next version.
 
