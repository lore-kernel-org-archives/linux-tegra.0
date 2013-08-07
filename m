From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzJdIGh3bW9uOiAobG05MCkgQWRkIHBvd2VyIGNvbnRy?=
 =?UTF-8?B?b2w=?=
Date: Wed, 07 Aug 2013 11:27:22 +0400
Message-ID: <1375860442.896960598@f427.i.mail.ru>
References: <1375858358-15070-1-git-send-email-wni@nvidia.com>
 <1375858358-15070-2-git-send-email-wni@nvidia.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1375858358-15070-2-git-send-email-wni@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?V2VpIE5p?= <wni@nvidia.com>
Cc: swarren@wwwdotorg.org, linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org, linux-tegra@vger.kernel.org, MLongnecker@nvidia.com, linux-arm-kernel@lists.infradead.org, khali@linux-fr.org, linux@roeck-us.net
List-Id: linux-tegra@vger.kernel.org

> The device lm90 can be controlled by the vdd rail.
> Adding the power control support to power on/off the vdd rail.
> And make sure that power is enabled before accessing the device.
> 
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/hwmon/lm90.c |   52 ++++++++++++++++++++++++++++++++++++++++++++++++++
[...]
> +	if (!data->lm90_reg) {
> +		data->lm90_reg = regulator_get(&client->dev, "vdd");
> +		if (IS_ERR_OR_NULL(data->lm90_reg)) {
> +			if (PTR_ERR(data->lm90_reg) == -ENODEV)
> +				dev_info(&client->dev,
> +					 "No regulator found for vdd. Assuming vdd is always powered.");
> +			else
> +				dev_warn(&client->dev,
> +					 "Error [%ld] in getting the regulator handle for vdd.\n",
> +					 PTR_ERR(data->lm90_reg));
> +			data->lm90_reg = NULL;
> +			mutex_unlock(&data->update_lock);
> +			return -ENODEV;
> +		}
> +	}
> +	if (is_enable) {
> +		ret = regulator_enable(data->lm90_reg);
> +		msleep(POWER_ON_DELAY);

Can this delay be handled directly from regulator?

[...]
---
