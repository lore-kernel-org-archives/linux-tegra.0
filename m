From: Bastian Hecht <hechtb@gmail.com>
Subject: Re: [PATCH v2 5/5] i2c: tegra: Remove suspension check
Date: Thu, 17 Jul 2014 18:52:35 +0200
Message-ID: <CABYn4swY5yRe=eGzCYo0uJtmjn05Ut4oDWupPjmU9bXbuU6+Pw@mail.gmail.com>
References: <1405608520-5644-1-git-send-email-hechtb@gmail.com>
 <1405608520-5644-5-git-send-email-hechtb@gmail.com>
 <20140717145958.GA32534@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140717145958.GA32534@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Wolfram Sang <wsa@the-dreams.de>, Linux-SH <linux-sh@vger.kernel.org>, Tomoya MORINAGA <tomoya.rohm@gmail.com>, open list <linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, linux-i2c@vger.kernel.org, "open list:TEGRA ARCHITECTUR..." <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

2014-07-17 16:59 GMT+02:00 Thierry Reding <thierry.reding@gmail.com>:
> On Thu, Jul 17, 2014 at 04:48:40PM +0200, Bastian Hecht wrote:
> [...]
>>  #ifdef CONFIG_PM_SLEEP
>> -static int tegra_i2c_suspend(struct device *dev)
>> -{
>> -     struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>> -
>> -     i2c_lock_adapter(&i2c_dev->adapter);
>> -     i2c_dev->is_suspended = true;
>> -     i2c_unlock_adapter(&i2c_dev->adapter);
>> -
>> -     return 0;
>> -}
>> -
>>  static int tegra_i2c_resume(struct device *dev)
>>  {
>>       struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>> @@ -842,14 +827,12 @@ static int tegra_i2c_resume(struct device *dev)
>>               return ret;
>>       }
>>
>> -     i2c_dev->is_suspended = false;
>> -
>>       i2c_unlock_adapter(&i2c_dev->adapter);
>>
>>       return 0;
>>  }
>>
>> -static SIMPLE_DEV_PM_OPS(tegra_i2c_pm, tegra_i2c_suspend, tegra_i2c_resume);
>> +static SIMPLE_DEV_PM_OPS(tegra_i2c_pm, tegra_i2c_resume);
>
> Shouldn't this be:
>
>         static SIMPLE_DEV_OPS(tegra_i2c_pm, NULL, tegra_i2c_resume);
>
> instead?

Oh yes thanks. I made the same mistake in [PATCH 3/5] too.

Thanks,

 Bastian



> Thierry
