From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] mfd: tps6586x: Move interrupt handling into workqueue
Date: Mon, 14 May 2018 15:01:49 +0300
Message-ID: <739706a9-4925-a7a0-686e-8d352ece4bac@gmail.com>
References: <20180513211842.7819-1-digetx@gmail.com>
 <20180514115135.GG18312@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180514115135.GG18312@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 14.05.2018 14:51, Thierry Reding wrote:
> On Mon, May 14, 2018 at 12:18:42AM +0300, Dmitry Osipenko wrote:
>> Reading of status register within the interrupt handler fails with -EAGAIN
>> if I2C is busy with handling some other request at the same time. Move the
>> actual interrupt handling into a workqueue to avoid the unfortunate I2C
>> failure and to avoid hanging CPU in interrupt up to 1 second (transfer
>> timeout in the Tegra I2C driver).
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/mfd/tps6586x.c | 40 +++++++++++++++++++++++++++++-----------
>>  1 file changed, 29 insertions(+), 11 deletions(-)
> 
> Could this not be achieved with a threaded interrupt handler?
> 
> Thierry
> 

Seems yes. I completely forgot about the threaded interrupt handlers existence.
Thank you very much for the suggestion, I'll try with the threaded IRQ and send
v2 if it will be fine.
