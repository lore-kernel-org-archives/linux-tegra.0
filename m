From: Andrey Danin <danindrey@mail.ru>
Subject: Re: [RFC 9/9] dts: tegra: WIP: hack dts to test new dt flags for
 i2c
Date: Mon, 20 Jul 2015 10:28:20 +0300
Message-ID: <55ACA314.6090104@mail.ru>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de> <1437142109-31975-10-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1437142109-31975-10-git-send-email-wsa@the-dreams.de>
Sender: linux-sh-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 17.07.2015 17:08, Wolfram Sang wrote:
> +
> +		eeprom@42 {
> +			compatible = "linux,slave-24c02";
> +			//FIXME: Should be I2C_OWN_SLAVE_ADDRESS | 0x42
> +			reg = <0xc0000042>;

I used it in this way:
reg = <(I2C_OWN_SLAVE_ADDRESS | 0x42)>;

> +		};
>   	};
>
>   	/* Expansion GEN2_I2C_* */
>

