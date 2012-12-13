From: Joe Perches <joe@perches.com>
Subject: Re: [PATCHv3 4/7] gpu: host1x: Add debug support
Date: Thu, 13 Dec 2012 07:23:11 -0800
Message-ID: <1355412191.12036.2.camel@joe-AO722>
References: <1355407484-28904-1-git-send-email-tbergstrom@nvidia.com>
	<1355407484-28904-5-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355407484-28904-5-git-send-email-tbergstrom@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Terje Bergstrom <tbergstrom@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 2012-12-13 at 16:04 +0200, Terje Bergstrom wrote:
> Add support for host1x debugging. Adds debugfs entries, and dumps
> channel state to UART in case of stuck job.

trivial note:

[]

> diff --git a/drivers/gpu/host1x/debug.h b/drivers/gpu/host1x/debug.h
[]
> +void host1x_debug_output(struct output *o, const char *fmt, ...);

This should be marked __printf(2, 3)
so the compiler verifies format and argument types.
