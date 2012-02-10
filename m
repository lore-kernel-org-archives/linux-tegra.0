From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Fri, 10 Feb 2012 14:50:22 +0530
Message-ID: <7A0BFCFE3DA5CD47B0FB7984326F201A13689D36EE@BGMAIL01.nvidia.com>
References: <1324898081-10308-1-git-send-email-alokc@nvidia.com>
 <20120106161803.GQ19115@trinity.fluff.org>
 <7A0BFCFE3DA5CD47B0FB7984326F201A134F2CD4F1@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7A0BFCFE3DA5CD47B0FB7984326F201A134F2CD4F1-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org" <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, "dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> On Mon, Dec 26, 2011 at 04:44:41PM +0530, Alok Chauhan wrote:
>> 
> +	/*
> +	 * In NACK error condition resetting of I2C controller happens
> +	 * before STOP condition is properly completed by I2C controller,
> +	 * so wait for 2 clock cycle to complete STOP condition.
> +	 */
> +	if (i2c_dev->msg_err == I2C_ERR_NO_ACK)
> +		udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->bus_clk_rate));
> +

>Is a delay here good, would it be better to sleep so that some other process can gain cpu time?
>>We mostly used 100 khz i2c clock frequency and delay in that case will be 20 usec. Would it be ok to sleep for such a smaller time? Won't it increase any other overhead?

Please let me know if sleep is better option here instead of waiting.

Thanks
Alok

--
To unsubscribe from this list: send the line "unsubscribe linux-i2c" in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
