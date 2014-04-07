From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Subject: Re: [PATCH V2] gpu: host1x: handle the correct # of syncpt regs
Date: Mon, 7 Apr 2014 11:34:22 +0300
Message-ID: <5342630E.90908@nvidia.com>
References: <1396650665-6992-1-git-send-email-swarren@wwwdotorg.org>
 <20140407081838.GB25718@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140407081838.GB25718@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On 07.04.2014 11:18, Thierry Reding wrote:
> If I understand correctly there's no immediate need for this to go to
> stable kernels, nor for it to be queued for 3.15, right? That is the
> potential extra write isn't causing any harm on actual hardware, is it?
> 
> In that case I'll queue this up for 3.16.

The reads and writes would get ignored on 32-bit kernel. The change does
fix sync point behavior in 64-bit kernel, so it is fixing a real issue.

Terje
