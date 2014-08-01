From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegra-pinmux-scripts] [PATCH] Add support for Norrin
Date: Fri, 01 Aug 2014 13:45:21 -0600
Message-ID: <53DBEE51.1060102@wwwdotorg.org>
References: <1406846532-12611-1-git-send-email-amartin@nvidia.com> <53DACE72.2060602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53DACE72.2060602-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/31/2014 05:17 PM, Stephen Warren wrote:
> On 07/31/2014 04:42 PM, Allen Martin wrote:
>> Add support for Tegra124 Norrin FFD reference board (PM370).  Pinmux
>> is based on PM370_T124_customer_pinmux_1.1 spreadsheet.
>
> Oh good; I guess the Excel spreadsheet format was similar enough to
> Jetson TK1 and Venice2 so no changes were required to
> csv-to-board-tegra124-xlsx.py other than adding the board name. That's
> good news:-)

Oh, I see I have the changes below in my local tree from when I was 
fiddling with adding Norrin to tegra-pinmux-scripts. Are you sure you 
don't need those?

> diff --git a/csv-to-board-tegra124-xlsx.py b/csv-to-board-tegra124-xlsx.py
> index e7afda7cd04d..fa986dc7b48a 100755
> --- a/csv-to-board-tegra124-xlsx.py
> +++ b/csv-to-board-tegra124-xlsx.py
> @@ -43,6 +43,7 @@ if dbg: print(args)
>
>  supported_boards = {
>      'jetson-tk1': 'T124_customer_pinmux_PM375_30Apr2014_v2.csv', # worksheet PM375Beaver_Configuration
> +    'norrin': 'PM370_T124_customer_pinmux_1.1.csv', # worksheet Customer_Configuration
>      'venice2': 'Venice2_T124_customer_pinmux_based_on_P4_rev47_2013-07-12.csv', # worksheet Customer_Configuration
>  }
>

Your patch has the part above, but none of:

> @@ -69,6 +70,7 @@ COL_E_INPUT = 12
>  COL_GPIO_INIT_VAL = 13
>  COL_DIRECTION = 14
>  COL_RCV_SEL = 15
> +COL_CUST_USAGE = 16
>
>  col_names = {
>      COL_BALL_NAME:     'Ball Name',
> @@ -85,6 +87,7 @@ col_names = {
>      COL_TRI:           'Tristate',
>      COL_E_INPUT:       'E_Input',
>      COL_GPIO_INIT_VAL: 'GPIO Init Value',
> +    COL_CUST_USAGE:    'Customer Usage',
>      COL_DIRECTION:     'Pin Direction',
>      COL_RCV_SEL:       'High or Normal VIL/VIH',
>  }
> @@ -184,13 +187,14 @@ with open(csvfile, newline='') as fh:
>          pupd = pupd_munge(row[cols[COL_PUPD]])
>          tri = tri_munge(row[cols[COL_TRI]])
>          e_input = e_input_munge(row[cols[COL_E_INPUT]])
> +        cust_usage = row[cols[COL_CUST_USAGE]].lower()
>          od = od_from_direction(row[cols[COL_DIRECTION]])
>          if cols[COL_RCV_SEL]:
>              rcv_sel = rcv_sel_munge(row[cols[COL_RCV_SEL]])
>          else:
>              rcv_sel = False
>
> -        mux_gpio = mux.startswith('gpio_p') or (mux == gpio)
> +        mux_gpio = mux.startswith('gpio_p') or (mux == gpio) or cust_usage.startswith('gpio3_p')
>          if mux_gpio:
>              mux = None
>              if e_input:
