From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH 2/4] Board CSV import: Put full CSV filename
 in data structure
Date: Wed, 15 Oct 2014 13:20:43 -0600
Message-ID: <543EC90B.4070705@wwwdotorg.org>
References: <1413306680-27330-1-git-send-email-swarren@wwwdotorg.org> <1413306680-27330-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413306680-27330-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/14/2014 11:11 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Putting the whole filename in to the data structure allows us to keep
> different CSV files in different directories. This will allow explicit
> separation of public and private CSV files.
>
> The per-board data is also modified to be a dictionary so that additional
> fields can be stored in the future.

I have applied this series.

>   supported_boards = {
> -    'jetson-tk1': 'T124_customer_pinmux_PM375_30Apr2014_v2.csv', # worksheet PM375Beaver_Configuration
> -    'norrin': 'PM370_T124_customer_pinmux_1.1.csv', # worksheet Customer_Configuration
> -    'venice2': 'Venice2_T124_customer_pinmux_based_on_P4_rev47_2013-07-12.csv', # worksheet Customer_Configuration
> +    'jetson-tk1': {
> +        # T124_customer_pinmux_PM375_30Apr2014_v2.xlsm worksheet PM375Beaver_Configuration
> +        # T124_customer_pinmux.xlsm worksheet Jetson TK1 Configuration
> +        # Jetson_TK1_customer_pinmux_release.xlsm worksheet Jetson TK1 Configuration
> +        'filename': 'csv/jetson-tk1.csv', # worksheet PM375Beaver_Configuration

I removed that stale comment on the filename: line, and added a note at 
the end of all the comments in this data structure re: which files use 
0- vs. 1-based rsvd numbering.
