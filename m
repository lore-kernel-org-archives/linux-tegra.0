From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] host1x: export host1x_syncpt_incr_max function
Date: Wed, 19 Feb 2014 15:24:52 -0700
Message-ID: <53052F34.4000009@wwwdotorg.org>
References: <1392848608-15056-1-git-send-email-cooloney@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1392848608-15056-1-git-send-email-cooloney@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Bryan Wu <cooloney@gmail.com>, thierry.reding@gmail.com, tbergstrom@nvidia.com
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

On 02/19/2014 03:23 PM, Bryan Wu wrote:
> Tegra V4L2 camera driver needs this function to do frame capture.

Does it need to be EXPORT_SYMBOL()d too, in case things are modules?
