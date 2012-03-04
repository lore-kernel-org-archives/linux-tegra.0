From: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
Subject: Re: [PATCH v2 2/6] ARM: tegra: select CPU_FREQ_TABLE
Date: Sun, 04 Mar 2012 14:47:31 -0500
Message-ID: <4F53C6D3.2060404@signal11.us>
References: <1330721908-8633-1-git-send-email-alan@signal11.us> <20120304183710.GB31064@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120304183710.GB31064-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 3/4/12 1:37 PM, Olof Johansson wrote:
> On Fri, Mar 02, 2012 at 03:58:28PM -0500, Alan Ott wrote:
>> From: Arnd Bergmann<arnd-r2nGTMty4D4@public.gmane.org>
>>
>> The tegra cpufreq implementation relies on the cpu_freq_table
>> code, so make sure that this is always there when needed.
>>
>> Signed-off-by: Arnd Bergmann<arnd-r2nGTMty4D4@public.gmane.org>
>> Signed-off-by: Alan Ott<alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>
>
> This didn't apply cleanly to the tegra tree (what was it based on?), but
> I fixed it up manually and applied to for-3.4/cleanups-and-fixes.
>

These were based on mainline.

Alan.
