From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom@nvidia.com>
Subject: Re: [PATCHv4 0/8] Support for Tegra 2D hardware
Date: Thu, 3 Jan 2013 08:14:06 +0200
Message-ID: <50E521AE.2030500@nvidia.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com>
	<1356097818.1490.109.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1356097818.1490.109.camel@tellur>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Lucas Stach <dev@lynxeye.de>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On 21.12.2012 15:50, Lucas Stach wrote:
> Am Freitag, den 21.12.2012, 13:39 +0200 schrieb Terje Bergstrom:
>> Some of the issues left open:
>>  * Register definitions still use static inline. There has been a
>>    debate about code style versus ability to use compiler type
>>    checking and code coverage analysis. There was no conclusion, so
>>    I left it as was.
> This has to be resolved before merging. Personally I'm in favour of
> keeping reg access patterns close to what is done in other parts of the
> kernel.

How about if I define inline functions, and #defines to proxy to them?
Something like:

static inline u32 host1x_sync_cfpeek_ctrl_r(void)
{
	return 0x74c;
}
#define HOST1X_SYNC_CFPEEK_CTRL \
	host1x_sync_cfpeek_ctrl_r()

static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_ena_f(u32 v)
{
	return (v & 0x1) << 31;
}
#define HOST1X_SYNC_CFPEEK_CTRL_CFPEEK_ENA_F(v) \
	host1x_sync_cfpeek_ctrl_cfpeek_ena_f(v)

I'd use the macros in .c files. That way the references will look
familiar to reader of .c files, but we can still get the benefits of
compiler processing (type checking, better error codes etc) and gcov
coverage tracking.

Terje
